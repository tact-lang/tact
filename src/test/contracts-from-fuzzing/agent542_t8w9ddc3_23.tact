struct Deep {
    leafVal: Int?;
    flag: Bool?;
}

struct Mid {
    d: Deep;
    txt: String?;
}

contract ParamDeepNested(
    mid: Mid,
    enabled: Bool
) {
    receive() {
        dump(self.enabled);
    }
}