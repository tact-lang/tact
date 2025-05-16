struct Inner { val: Int?; }

struct Mid { inr: Inner = Inner{ val: null }; }

contract ChainPass {
    top: Mid = Mid{};
}
