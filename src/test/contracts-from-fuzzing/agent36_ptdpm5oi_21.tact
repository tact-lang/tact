struct SliceHolder {
    foo: Slice?;
    bar: String;
}

contract SliceOptPersist {
    record: SliceHolder;

    init() {
        self.record = SliceHolder{
            foo: null,
            bar: "abc"
        };
    }

    receive() {
        let _ = self.record;
    }
}