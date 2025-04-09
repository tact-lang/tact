contract Test5 {
    receive() {}
    
    // Getter returning an optional Int (null)
    get fun getNull(): Int? {
         return null;
    }
}
