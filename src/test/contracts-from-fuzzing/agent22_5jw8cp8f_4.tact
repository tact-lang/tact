contract TestAssign {
    receive() {
       let x: Int = 10;
       x = 20;
       dump(x);
    }
}
