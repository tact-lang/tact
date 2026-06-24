struct DeepOption {
    innerOpt: Int?;
}

struct NestedOpt {
    deep: DeepOption?;
}

contract OptWrap {
    val: NestedOpt = NestedOpt{ deep: null };
    receive() {}
}
