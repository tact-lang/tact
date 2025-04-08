struct Lv3 { val: Int = 3; }
struct Lv2 { next: Lv3 = Lv3{}; }
struct Lv1 { next: Lv2 = Lv2{}; }

contract DeepStructChain { chain: Lv1 = Lv1{ next: Lv2{ next: Lv3{} } };
}