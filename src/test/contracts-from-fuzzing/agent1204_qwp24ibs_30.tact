// struct with one optional nested struct that has defaults
struct DefaultsNested {
    x: Int = 1;
    y: Bool = true;
}

struct OuterOption {
    child: DefaultsNested?;
}

contract OptWithDefaultsChild {
    data: OuterOption;

    init() {
        self.data = OuterOption{ child: null };
    }
}