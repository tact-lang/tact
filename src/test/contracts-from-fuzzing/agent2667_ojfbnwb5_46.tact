struct ManyDefaultsAndOptions {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
    d: Int = 42;
    e: Bool = false;
    f: String = "str";
}

contract ManyDefaultsOptions {
    data: ManyDefaultsAndOptions;

    init() {
        self.data = ManyDefaultsAndOptions{};
    }

    receive() {
        self.data = ManyDefaultsAndOptions{
            a:1,b:true,c:"hi",d:7,e:true,f:"bye"
        };
    }
}