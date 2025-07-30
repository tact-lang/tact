struct SliceHolder {
    chunk: Slice? = null;
}

contract SliceOptStorage {
    s: SliceHolder;

    init() {
        self.s = SliceHolder{ chunk: null };
    }

    receive() {
        let _ = self.s;
    }
}