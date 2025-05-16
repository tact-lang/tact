struct SNested {
    y: Int?;
}

struct SMid {
    mid: SNested?;
}

struct SOuter {
    outer: SMid?;
}

contract Test {
    field: SOuter;

    init() {
        self.field = SOuter{
            outer: SMid{
                mid: SNested{
                    y: null
                }
            }
        };
    }
}