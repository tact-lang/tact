// test explicit optional default
contract OptDefaultsExplicit {
    x: Int? = null;
    y: String? = "hello";
    z: Bool? = false;

    init() {
        // no explicit assigns
    }
}