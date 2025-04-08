struct Mix {
    txt: String;
    addr: Address;
}

contract TestContract {
    data: Mix;

    init() {
        self.data = Mix{
            txt: "hey",
            addr: myAddress()
        };
    }

    receive() {
        let _ = self.data.addr;
    }
}