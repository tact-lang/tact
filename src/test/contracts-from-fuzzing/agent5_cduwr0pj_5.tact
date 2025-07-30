struct Layer3 {
    z: Int;
}

struct Layer2 {
    inner: Layer3?;
}

struct Layer1 {
    wrapped: Layer2?;
}

contract DeepOptional {
    stuff: Layer1 = Layer1{ wrapped: null };
}
