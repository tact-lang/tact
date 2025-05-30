// Edge case: mix init default assignment with field default and nested optional
struct NestedInitDefaults {
    val: Int? = null;
    flag: Bool;
}

contract DefaultsMix {
    data: NestedInitDefaults? = null;

    init() {
        self.data = null;
    }
}