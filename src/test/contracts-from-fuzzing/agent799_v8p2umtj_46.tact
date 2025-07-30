// deeply nested structs with multiple optional nullable layers
struct Bottom { val: Int? }
struct Mid { bot: Bottom? }
struct Top { mid: Mid? }

contract DeepOptionalLayers {
    f: Top? = null;

    init() {
        self.f = Top{ mid: Mid{ bot: Bottom{ val: 1 } } };
    }
}