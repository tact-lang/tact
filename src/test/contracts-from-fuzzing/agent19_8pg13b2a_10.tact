contract TestToStringChainingCorrected {
    fun helper(x: Int): String { return x.toString(); }
    receive() {
       dump(self.helper(100));
       dump(123.toString());
    }
}
