contract TestUnaryNot {
    receive() {
       let b: Bool = !true;
       dump(b);
    }
}
