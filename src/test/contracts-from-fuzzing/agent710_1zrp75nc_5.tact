struct DeepNest3 {
    val: Int;
}

struct DeepNest2 {
    inner: DeepNest3;
}

struct DeepNest1 {
    inner: DeepNest2;
}

contract DeepStored {
    nest: DeepNest1 = DeepNest1{ inner: DeepNest2{ inner: DeepNest3{ val: 42 } } };
}