struct InfoSimple {
    x: Int;
}

contract ImplicitNullOptional {
    optField: InfoSimple?; // no assignment in init()
    
    init() {
        // explicitly do nothing, so field remains null
    }
}
