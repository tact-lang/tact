struct Minimal {
    a: Int?;
}

contract TestStorage {
    data: Minimal = Minimal{ a: null };

    receive() {
        let x = self.data;
    }
}