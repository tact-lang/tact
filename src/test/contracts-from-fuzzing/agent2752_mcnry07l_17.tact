struct Deep1 { a: Int = 1; }
struct Deep2 { b: Deep1 = Deep1{}; }
struct Deep3 { c: Deep2 = Deep2{}; }
struct Deep4 { d: Deep3 = Deep3{}; }

contract DeepLevels {
    deep: Deep4 = Deep4{};
}