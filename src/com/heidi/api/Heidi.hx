package com.heidi.api;

import org.tamina.net.URL;
import com.sakura.api.SakuraEditor;
import com.sakura.api.SakuraIO;
import js.html.Element;
import org.tamina.events.Event;
import js.html.InputElement;
import org.tamina.log.LogLevel;
import js.html.XMLHttpRequest;
import msignal.Signal;

@:native("Heidi")
extern class Heidi {
    public static function getInstance():Heidi;

    /**
     * Initialise le module avec sa configuration
     * @method init
     * @param   config {HeidiConfig} la configuration du module
     */
    public function init(config:HeidiConfig):Void;

    /**
     * Change le patron courant pour celui de l'id passé en parametre
     * @method changePattern
     * @param   patternId {Int} l'Id du Patron
     */
    public function changePattern(patternId:Int):Void;

    /**
	 * Ajoute un écouteur
	 * @method addEventListener
	 * @param	type {HeidiEventType} le type de l'evennement
	 * @param	listener {HeidiEvent -> Void} la methode à invoquer
	 * @param	?useCapture {Bool}
	 */
    public function addEventListener(type:HeidiEventType, listener:Event<HeidiEventType> -> Void, ?useCapture:Bool):Void;

    /**
     * Ajoute une image depuis une url externe dans la galerie et la perso
     * @method addExternalImageFromUrl
     * @param   imageUrl {String} url de l'image
     */
    public function addExternalImageFromUrl(imageUrl:String):Void;

    /**
     * Retourne la reference à la Factory de View
     * @method getViewFactory
     * @return result {ViewFactory} la factory
     */
    public function getViewFactory():ViewFactory;

/**
	 * Retire un écouteur
	 * @method removeEventListener
	 * @param	type {HeidiEventType} le type de l'evennement
	 * @param	listener {HeidiEvent -> Void} la methode à invoquer
	 */

    public function removeEventListener(type:HeidiEventType, listener:Event<HeidiEventType> -> Void):Void ;

/**
	 * Retire tous les écouteurs
	 * @method removeAllEventListeners
	 * @param	type {HeidiEventType} le type de l'evennement
	 */

    public function removeAllEventListeners(type:HeidiEventType):Void ;

/**
     * Affiche une personnalisation à partir de son Hash
     * @method displayCustomerDesignByHash
     * @param   hash {String} l'Id du CustomerDesign encodé
     */
    public function displayCustomerDesignByHash(hash:String):Void;
}

/**
* Factory servant à fournir les View de l'application
* @author d.mouton
* @class ViewFactory
* @static
*/
interface ViewFactory {


/**
	 * Definie la Class à utiliser pour instancier un Menu
	 * @method setMenuClass
	 * @param	type {Class<IMenuView>} le type
	 */
    public function setMenuClass(type:Class<IMenuView>):Void;

/**
	 * Definie la Class à utiliser pour instancier une Gallery
	 * @method setGalleryClass
	 * @param	type {Class<IGalleryView>} le type
	 */
    public function setGalleryClass(type:Class<IGalleryView>):Void;

/**
	 * Definie la Class à utiliser pour instancier une NotificationPopup
	 * @method setNotificationPopupClass
	 * @param	type {Class<INotificationPopup>} le type
	 */
    public function setNotificationPopupClass(type:Class<INotificationPopup>):Void;

/**
	 * Definie la Class à utiliser pour instancier un Freezer
	 * @method setFreezerClass
	 * @param	type {Class<IFreezer>} le type
	 */
    public function setFreezerClass(type:Class<IFreezer>):Void;

/**
	 * Definie la Class à utiliser pour instancier une ExternalGallery
	 * @method setExternalGalleryClass
	 * @param	type {Class<IExternalGalleryView>} le type
	 */
    public function setExternalGalleryClass(type:Class<IExternalGalleryView>):Void;

/**
	 * Definie la Class à utiliser pour instancier la Gallerie de Template
	 * @method setTemplatesGalleryClass
	 * @param	type {Class<ITemplateGalleryComponent>} le type
	 */
    public function setTemplatesGalleryClass(type:Class<ITemplateGalleryComponent>):Void;

/**
	 * Definie la Class à utiliser pour instancier un editeur de Picture
	 * @method setPictureEditorClass
	 * @param	type {Class<IPictureEditorComponent>} le type
	 */
    public function setPictureEditorClass(type:Class<IPictureEditorComponent>):Void;

/**
	 * Definie la Class à utiliser pour instancier un editeur de Text
	 * @method setTextEditorClass
	 * @param	type {Class<ITextEditorComponent>} le type
	 */
    public function setTextEditorClass(type:Class<ITextEditorComponent>):Void;

/**
	 * Crée une instance de Menu
	 * @method createMenu
	 * @param	containerId {String} l'id de la div contenant le Menu
	 * @return {IMenuView} le Menu
	 */
    public function createMenu(containerId:String):IMenuView;

/**
	 * Crée une instance de Gallery
	 * @method createGallery
	 * @param	containerId {String} l'id de la div contenant la Gallery
	 * @return {IGalleryView} la Gallery
	 */
    public function createGallery(containerId:String):IGalleryView;

/**
	 * Crée une instance de NotificationPopup
	 * @method createNotificationPopup
	 * @param	containerId {String} l'id de la div contenant la NotificationPopup
	 * @return {INotificationPopup} la NotificationPopup
	 */
    public function createNotificationPopup(containerId:String):INotificationPopup;

/**
	 * Crée une instance de Freezer
	 * @method createFreezer
	 * @param	containerId {String} l'id de la div contenant le Freezer
	 * @return {IFreezer} le Freezer
	 */
    public function createFreezer(containerId:String):IFreezer;

/**
	 * Crée une instance de ExternalGallery
	 * @method createExternalGallery
	 * @param	containerId {String} l'id de la div contenant le ExternalGallery
	 * @param	heidiContainer {Element} la reference à la div qui contient Heidi
	 * @return {IExternalGalleryView} le Freezer
	 */
    public function createExternalGallery(containerId:String = "", heidiContainer:Element):IExternalGalleryView;

/**
	 * Crée une instance de liste des Template
	 * @method createTemplatesGallery
	 * @param	containerId {String} l'id de la div contenant le composant
	 * @return {ITemplateGalleryComponent} le Freezer
	 */
    public function createTemplatesGallery(containerId:String):ITemplateGalleryComponent;

/**
	 * Crée une instance d'editeur de Picture
	 * @method createPictureEditor
	 * @param	containerId {String} l'id de la div contenant le composant
	 * @return {IPictureEditorComponent} le Freezer
	 */
    public function createPictureEditor(containerId:String):IPictureEditorComponent;

/**
	 * Crée une instance d'editeur de Text
	 * @method createTextEditor
	 * @param	containerId {String} l'id de la div contenant le composant
	 * @return {ITextEditorComponent} l'editeur de Text
	 */
    public function createTextEditor(containerId:String):ITextEditorComponent;

}

interface HeidiImage {

    public var id:Float;
    public var url:URL;
    public var ref:Picture;

}

interface IMenuView {

    var displayExternalSignal:Signal2<ExternalImageProviderType, String>;
    var addTextSignal:Signal0;
}

interface IGalleryView {
    public var images(get, null):Array<HeidiImage>;
}

interface INotificationPopup {
    function setParams(parameters:NotificationParameters):Void;
    var visible(get, set):Bool;
}

interface IFreezer {
    var visible(get, set):Bool;
    function setContent(content:String):Void;
}

interface IExternalGalleryView {
    function open(provider:ExternalImageProviderType, token:String):Void;
}
interface ITemplateGalleryComponent {
    var templates(get,set):Array<TemplateInfo>;
    var visible(get, set):Bool;
    var changeSignal:Signal1<Int>;
}

interface IPictureEditorComponent extends IEditorComponent {
    var changeSignal:Signal2<PictureFilter,Float>;
    var visible(get, set):Bool;
    var picture(get, set):Picture;
}

interface ITextEditorComponent extends IEditorComponent {
    var changeSignal:Signal0;
    var visible(get, set):Bool;
    var text(get, set):Text;
}

interface NotificationParameters {

    public var title:String;
    public var content:String ;
    public var cancelText:String ;
    public var confirmText:String ;
    public var callback:Void->Void;

}

interface IEditorComponent {

    var element:Element;
    var parent:Element;
}

interface HeidiConfig {
    public var token:String;
    public var configURL:String;
    public var layoutURL:String;
    public var imagesURL:String;
    public var host:String;
    public var patternId:Int;
    public var isCustomerDesign:Bool;
    public var editorCreationDiv:String;
    public var logLevel:LogLevel = LogLevel.INFO;
    public var hostProxy:IHostProxy;
    public var loginView:ILoginOrCreateAccountView;
    public var isLogged:Bool;
    public var addToCartButton:InputElement;
    public var canUploadMultipleImages:Bool;
    public var availableFonts:Array<String>;

}

interface IHostProxy {
    public var addToCartComplete:Signal0;
    public var saveCustomerDesignComplete:Signal0;
    public var loginOrCreateAccountSuccess:Signal1<XMLHttpRequest>;
    public var loginOrCreateAccountError:Signal1<XMLHttpRequest>;
    public var getCustomerDesignTokenSuccess:Signal1<XMLHttpRequest>;
    public var getCustomerDesignTokenError:Signal1<XMLHttpRequest>;

    public function addToCart(customerDesignId:Float,previewUrl:String):Void;
    public function saveCustomerDesign(customerDesignId:Float,previewUrl:String):Void;
    public function loginOrCreateAccount(data:String):Void;
    public function getCustomerDesignToken(idC:Float):Void;

}

interface ILoginOrCreateAccountView {
    public var isNowLogged:Signal1<Bool>;
}


/**
* Type d'évenement porté par les HeidiEvent
* @author d.mouton
* @class HeidiEventType
* @static
*/

typedef HeidiEvent = Event<HeidiEventType>;

@:enum abstract HeidiEventType(String) from String to String {


/**
	 * @property READY
	 * @type String
	 * @static
	 * @readOnly
	 * @default "ready"
	 */
    var READY = "ready";
/**
	 * @property PATTERN_COMPLETE
	 * @type String
	 * @static
	 * @readOnly
	 * @default "patternComplete"
	 */
    var PATTERN_COMPLETE = "patternComplete";


}