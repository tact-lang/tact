struct DeepRec1 { f: Int; }
struct DeepRec2 { f: DeepRec1; }
struct DeepRec3 { f: DeepRec2; }
struct DeepRec4 { f: DeepRec3; }
struct DeepRec5 { f: DeepRec4; }
struct DeepRec6 { f: DeepRec5; }
struct DeepRec7 { f: DeepRec6; }

contract ManyLayers {
    d: DeepRec7;

    init() {
        self.d = DeepRec7{ f: DeepRec6{ f: DeepRec5{ f: DeepRec4{ f: DeepRec3{ f: DeepRec2{ f: DeepRec1{ f: 1 } } } } } } };
    }
}