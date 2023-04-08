import "@stdlib/dns";
import "@stdlib/deploy";

contract DNSTester with Deployable {

    init() {
        
    }

    get fun stringToInternal(src: String): Slice? {
        return dnsStringToInternal(src);
    }

    get fun internalNormalize(src: Slice): Slice {
        return dnsInternalNormalize(src);
    }
}