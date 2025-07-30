struct DeepInner { a: Int; }
struct Mid { deep: DeepInner?; }

contract NestedOpt {
    nested: Mid = Mid{ deep: null };
}