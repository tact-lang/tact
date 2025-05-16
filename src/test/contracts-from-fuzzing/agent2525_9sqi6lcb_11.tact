// Slight variation, explicitly initialize the nested structure

struct DeepDefault3 {
    z: Bool = false;
}

struct DeepDefault2 {
    inner: DeepDefault3;
    y: String = "yo";
}

struct DeepDefault1 {
    nested: DeepDefault2;
    x: Int = 88;
}

contract TestContract {
    d: DeepDefault1;

    init() {
        self.d = DeepDefault1{
            nested: DeepDefault2{
                inner: DeepDefault3{},
            }
        };
    }
}