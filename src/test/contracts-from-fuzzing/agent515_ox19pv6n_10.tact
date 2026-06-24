message(303) DataMsg {
    v: Int = 100;
}

contract Test {
    saved: DataMsg?; // default null implied

    init() {
        // assign optional message instance at init
        self.saved = DataMsg{v: 123};
    }

    receive() {
        if (self.saved != null) {
            let _ = self.saved!!.v;
        }
    }
}