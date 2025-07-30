struct OptionalLevel1 {
    inner: OptionalLevel2?;
}

struct OptionalLevel2 {
    inner: OptionalLevel3?;
}

struct OptionalLevel3 {
    inner: OptionalLevel4?;
}

struct OptionalLevel4 {
    val: Int?;
}

contract TestContract {
    x: OptionalLevel1;

    init() {
        self.x = OptionalLevel1{ inner: null };
    }
}