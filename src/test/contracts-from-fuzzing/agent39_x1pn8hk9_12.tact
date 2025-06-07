contract GetterInit {
    init() {}

    get fun initHash() : Int {
         // Compute the hash using contractHash of the code and data from initOf
         let s = initOf GetterInit();
         return contractHash(s.code, s.data);
    }
}
