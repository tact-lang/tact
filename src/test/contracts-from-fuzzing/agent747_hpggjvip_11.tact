struct ManyDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "hi";
    d: Int?;         
    e: Bool?;        
    f: String?;
}

contract TestContract {
    val: ManyDefaults;

    init() {
        self.val = ManyDefaults {
            d: null,
            e: null,
            f: null,
        };
    }
}