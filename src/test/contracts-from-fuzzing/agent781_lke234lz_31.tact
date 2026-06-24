struct MultiDefaults {
    a: Int = 10;
    b: String = "x";
    c: Bool = false;
    d: Address?;
}

contract MultiDefaultsContract {
    val: MultiDefaults;

    init() {
        self.val = MultiDefaults{
            a:999,
            b:"z",
            c:true,
            d:null
        };
    }
}