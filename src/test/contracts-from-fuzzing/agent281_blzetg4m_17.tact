// Deeply nested structure, with a string at bottom
struct Lvl3 { s: String }
struct Lvl2 { next: Lvl3 }
struct Lvl1 { next: Lvl2 }

contract DeepStringNested {
    val: Lvl1;
    init() {
        self.val = Lvl1{ next: Lvl2{ next: Lvl3{ s: "deep" } } };
    }
}