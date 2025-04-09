struct In { x: Int }

struct Out { inside: In }

struct Wrap { outside: Out? }

contract HasDeepOption {
    deepOpt: Wrap;

    init() {
        self.deepOpt = Wrap{
            outside: Out{ inside: In{ x: 1 } }
        };
    }
}