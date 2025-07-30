struct Layer3 {
    x: Int;
}

struct Layer2 {
    y: Layer3?;
}

struct Layer1 {
    z: Layer2?;
}

contract DeepNestedOptional {
    deep: Layer1? = null;
}