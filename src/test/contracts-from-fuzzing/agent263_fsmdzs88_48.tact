struct DeepFirst {
    next: DeepSecond;
}
struct DeepSecond {
    next: DeepThird;
}
struct DeepThird {
    next: DeepFourth;
}
struct DeepFourth {
    next: DeepFifth;
}
struct DeepFifth {
    val: Int;
}

contract FiveDeepStruct {
    s: DeepFirst;
    init() {
        self.s = DeepFirst{next:DeepSecond{next:DeepThird{next:DeepFourth{next:DeepFifth{val:5}}}}};
    }
}