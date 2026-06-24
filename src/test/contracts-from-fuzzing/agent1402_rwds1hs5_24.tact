struct Layer3 {
    z: String;
}

struct Layer2 {
    y: Bool;
    l3: Layer3;
}

struct Layer1 {
    x: Int;
    l2: Layer2;
}

contract ThreeLayerParam(
    foo: Layer1
) {}