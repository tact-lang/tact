contract TestStorageReserve {
    override const storageReserve: Int = ton("0.1");
    
    receive() { }
}
