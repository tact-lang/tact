contract TestReturnNull {
    receive () {}

    get fun getNull(): Int? {
         return null;
    }
}
