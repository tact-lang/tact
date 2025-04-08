struct VeryDeep3 { value: Int; }
struct VeryDeep2 { child: VeryDeep3; optional: String?; }
struct VeryDeep1 { child: VeryDeep2; flag: Bool; }

contract TestContract {
    root: VeryDeep1;

    init() {
        self.root = VeryDeep1{
            child: VeryDeep2{
                child: VeryDeep3{value: 123},
                optional: "hello"
            },
            flag: true
        };
    }
}