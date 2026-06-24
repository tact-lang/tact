contract TestFuncString {
    fun echo(s: String): String {
        return s;
    }
    
    receive() {
        let r: String = self.echo("Hello, function!");
        r;
    }
}
