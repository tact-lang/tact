contract TestAssignValid {
    receive() {
        let x: Int = 5;
        x = 10;
        dump(x);
    }
}
