struct DeepNested1 { v: Int; }
struct DeepNested2 { n1: DeepNested1; flag: Bool?; }
struct DeepNested3 { n2: DeepNested2; s: String; }
struct DeepNested4 { n3: DeepNested3; num: Int; }

contract TestStorage {
    complex: DeepNested4;

    init() {
        self.complex = DeepNested4{
            n3: DeepNested3{
                n2: DeepNested2{ n1: DeepNested1{ v: 123 }, flag: false },
                s: "test"
            },
            num: 456
        };
    }
}