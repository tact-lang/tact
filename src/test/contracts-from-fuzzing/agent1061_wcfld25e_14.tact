// Deep nested contracts field with serialization attributes
struct Small { num: Int as uint16; }

struct Middle { s: Small; flag: Bool; }

struct Top { m: Middle; text: String; count: Int as uint4; }

contract Test {
    value: Top;

    init() {
        self.value = Top{
            m: Middle{ s: Small{ num: 255 }, flag: true },
            text: "zzz",
            count: 10
        };
    }
}