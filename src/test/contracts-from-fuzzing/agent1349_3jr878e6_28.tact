struct Mid {
    opt: Int?;
    b: Bool;
}

contract OptMixField {
    mid: Mid = Mid{ opt:null, b:false };

    receive() {
        self.mid = self.mid;
    }
}