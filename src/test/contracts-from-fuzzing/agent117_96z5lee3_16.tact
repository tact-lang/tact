// Struct with mixture of explicit defaults, optional fields, and no defaults
struct Mix {
    a: Int = 1;
    b: Int?;
    c: String? = null;
    d: Bool;
}

contract MixDefaults {
    val: Mix;

    init() {
        self.val = Mix{a:2,b:null,c:null,d:true};
    }
}