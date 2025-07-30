struct DeepDefaults {
    layer1: Inner1;
}

struct Inner1 {
    layer2: Inner2;
}

struct Inner2 {
    x: Int = 7;
    s: String = "hi";
}

contract TestContract {
    val: DeepDefaults = DeepDefaults{
        layer1: Inner1{
            layer2: Inner2{} // using defaults on nested
        }
    };
}