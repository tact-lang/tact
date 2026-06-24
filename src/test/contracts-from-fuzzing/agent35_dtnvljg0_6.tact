trait HasX {
    x: Int; // persistent state variable defined in trait
    fun getX(): Int { return self.x; }
}

contract T(x: Int) with HasX {
    receive() {
        dump(self.getX());
    }
}
