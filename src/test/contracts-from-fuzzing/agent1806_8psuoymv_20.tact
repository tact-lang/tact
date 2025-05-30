struct Layers1 { v: Int }
struct Layers2 { inner: Layers1 }
struct Layers3 { inner: Layers2 }

contract MultiLayers {
    l: Layers3;
    init() {
        self.l = Layers3{ inner: Layers2{ inner: Layers1{ v:77 } } };
    }
}