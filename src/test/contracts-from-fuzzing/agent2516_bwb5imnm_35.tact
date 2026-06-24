struct DeepInner { v: Int = 5; }
struct DeepMid { inner: DeepInner = DeepInner{}; }

contract DeepDefaults {
    mid: DeepMid = DeepMid{};
}