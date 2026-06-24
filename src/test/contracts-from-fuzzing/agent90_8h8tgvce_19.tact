struct Person {
    name: String;
    age: Int?;
}

contract TestStorage(info: Person?) {
    receive() {
        let _ = self.info;
    }
}