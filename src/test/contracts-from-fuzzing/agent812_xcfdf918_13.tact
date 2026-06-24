struct Layers1 { val: Int }
struct Layers2 { s1: Layers1 }
struct Layers3 { s2: Layers2 }
struct Layers4 { s3: Layers3 }
struct Layers5 { s4: Layers4 }

contract DeepLayers {
    layer: Layers5;

    init() {
        self.layer = Layers5{ s4: Layers4{ s3: Layers3{ s2: Layers2{ s1: Layers1{ val: 123 }}}}};
    }
}