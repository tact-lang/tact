struct Info {
    text: String;
    flag: Bool = false;
}

struct Complex {
    val: Int;
    infoOpt: Info? = null;
    infoReq: Info; // required init
}

contract MixDefaultsOptRequired {
    store: Complex;

    init() {
        self.store = Complex{
            val: 7,
            infoReq: Info{ text: "yo", flag: true }
            // infoOpt left null (default)
        };
    }
}