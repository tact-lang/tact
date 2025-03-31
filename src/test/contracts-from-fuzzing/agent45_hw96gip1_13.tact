contract TestCallGetter {
    x: Int = 567;

    receive() {
         let y = self.getX();
    }

    get fun getX(): Int {
         return self.x;
    }
}
