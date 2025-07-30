trait MyTrait {
    const MY_T: Int = 10;
}

contract TestContract with MyTrait {
    receive() {
        let result: Int = self.MY_T + 5;
    }
}
