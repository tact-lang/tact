// Unique mix of optional nested inside struct
struct SubData {
    s: String?;
}

struct Container {
    d: SubData?;
    flag: Bool;
}

contract MixOptionals {
    storage: Container;

    init() {
        self.storage = Container{
            d: null,
            flag: false,
        };
    }
}