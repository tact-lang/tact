import { suggestFunctions, FunctionSignature } from "./suggestFunctions";

// List of real functions
const functions: FunctionSignature[] = [
    { name: "beginCell", signature: "asm fun beginCell(): Builder { NEWC }" },
    {
        name: "storeInt",
        signature:
            "@name(store_int) extends native storeInt(self: Builder, value: Int, bits: Int): Builder;",
    },
    {
        name: "storeUint",
        signature:
            "@name(store_uint) extends native storeUint(self: Builder, value: Int, bits: Int): Builder;",
    },
    {
        name: "storeBool",
        signature:
            "@name(__tact_store_bool) extends native storeBool(self: Builder, value: Bool): Builder;",
    },
    {
        name: "storeBit",
        signature:
            "@name(__tact_store_bool) extends native storeBit(self: Builder, value: Bool): Builder;",
    },
    {
        name: "storeCoins",
        signature:
            "asm extends fun storeCoins(self: Builder, value: Int): Builder { STVARUINT16 }",
    },
    {
        name: "storeVarUint16",
        signature:
            "asm extends fun storeVarUint16(self: Builder, value: Int): Builder { STVARUINT16 }",
    },
    {
        name: "storeVarInt16",
        signature:
            "asm extends fun storeVarInt16(self: Builder, value: Int): Builder { STVARINT16 }",
    },
    {
        name: "storeVarUint32",
        signature:
            "asm extends fun storeVarUint32(self: Builder, value: Int): Builder { STVARUINT32 }",
    },
    {
        name: "storeVarInt32",
        signature:
            "asm extends fun storeVarInt32(self: Builder, value: Int): Builder { STVARINT32 }",
    },
    {
        name: "contractAddressExt",
        signature:
            "@name(__tact_compute_contract_address) native contractAddressExt(chain: Int, code: Cell, data: Cell): Address;",
    },
    {
        name: "contractAddress",
        signature:
            "inline fun contractAddress(s: StateInit): Address { return contractAddressExt(0, s.code, s.data); }",
    },
    {
        name: "asSlice",
        signature:
            "@name(__tact_address_to_slice) extends native asSlice(self: Address): Slice;",
    },
    {
        name: "newAddress",
        signature:
            "@name(__tact_create_address) native newAddress(chain: Int, hash: Int): Address;",
    },
    { name: "myAddress", signature: "asm fun myAddress(): Address { MYADDR }" },
    {
        name: "myBalance",
        signature: "asm fun myBalance(): Int { BALANCE FIRST }",
    },
    {
        name: "gasConsumed",
        signature: "asm fun gasConsumed(): Int { GASCONSUMED }",
    },
    {
        name: "myStorageDue",
        signature: "asm fun myStorageDue(): Int { DUEPAYMENT }",
    },
    {
        name: "getStorageFee",
        signature:
            "asm fun getStorageFee(cells: Int, bits: Int, seconds: Int, isMasterchain: Bool): Int { GETSTORAGEFEE }",
    },
    {
        name: "getComputeFee",
        signature:
            "asm fun getComputeFee(gasUsed: Int, isMasterchain: Bool): Int { GETGASFEE }",
    },
    {
        name: "getSimpleComputeFee",
        signature:
            "asm fun getSimpleComputeFee(gasUsed: Int, isMasterchain: Bool): Int { GETGASFEESIMPLE }",
    },
    {
        name: "getForwardFee",
        signature:
            "asm fun getForwardFee(cells: Int, bits: Int, isMasterchain: Bool): Int { GETFORWARDFEE }",
    },
    {
        name: "getSimpleForwardFee",
        signature:
            "asm fun getSimpleForwardFee(cells: Int, bits: Int, isMasterchain: Bool): Int { GETFORWARDFEESIMPLE }",
    },
    {
        name: "getOriginalFwdFee",
        signature:
            "asm fun getOriginalFwdFee(fwdFee: Int, isMasterchain: Bool): Int { GETORIGINALFWDFEE }",
    },
    {
        name: "parseStdAddress",
        signature:
            "asm fun parseStdAddress(slice: Slice): StdAddress { REWRITESTDADDR }",
    },
    {
        name: "parseVarAddress",
        signature:
            "asm fun parseVarAddress(slice: Slice): VarAddress { REWRITEVARADDR }",
    },
    { name: "curLt", signature: "asm fun curLt(): Int { LTIME }" },
    { name: "blockLt", signature: "asm fun blockLt(): Int { BLOCKLT }" },
    {
        name: "setGasLimit",
        signature: "asm fun setGasLimit(limit: Int) { SETGASLIMIT }",
    },
    { name: "getSeed", signature: "asm fun getSeed(): Int { RANDSEED }" },
    { name: "setSeed", signature: "asm fun setSeed(seed: Int) { SETRAND }" },
    { name: "myCode", signature: "asm fun myCode(): Cell { MYCODE }" },
];

// Define realistic typo test cases.
const testCases = [
    { query: "stroeInt", description: "transposition in storeInt" },
    { query: "storeit", description: "missing letter in storeInt" },
    { query: "stroeBool", description: "transposition in storeBool" },
    { query: "storBit", description: "missing letter in storeBit" },
    { query: "conractAddress", description: "typo in contractAddress" },
    {
        query: "contractAdressExt",
        description: "missing letter in contractAddressExt",
    },
    { query: "asSlic", description: "missing letter in asSlice" },
    { query: "newAdress", description: "missing letter in newAddress" },
    { query: "myAddres", description: "missing letter in myAddress" },
    { query: "myBalanace", description: "transposition in myBalance" },
    { query: "gasConumed", description: "missing letter in gasConsumed" },
    { query: "myStroageDue", description: "transposition in myStorageDue" },
    { query: "getStoragFee", description: "missing letter in getStorageFee" },
    { query: "getComputFee", description: "missing letter in getComputeFee" },
    { query: "getForwadFee", description: "transposition in getForwardFee" },
    {
        query: "getOriginalFwdFe",
        description: "missing letter in getOriginalFwdFee",
    },
    {
        query: "parseStdAdress",
        description: "missing letter in parseStdAddress",
    },
    {
        query: "parseVarAdress",
        description: "missing letter in parseVarAddress",
    },
    { query: "blokLt", description: "missing letter in blockLt" },
    { query: "setGasLimt", description: "missing letter in setGasLimit" },
    { query: "getSead", description: "transposition in getSeed" },
    { query: "setSead", description: "transposition in setSeed" },
    { query: "myCdoe", description: "transposition in myCode" },

    {
        query: "Stroe_Int",
        description: "transposition and underscore in storeInt",
    },
    {
        query: "stroe__int",
        description: "transposition with extra underscore in storeInt",
    },
    {
        query: "stroe_bool",
        description: "transposition with underscore in storeBool",
    },
    {
        query: "conTract_adresx",
        description:
            "multiple typos in contractAddressExt (extra letter 'x' instead of expected 't')",
    },
    {
        query: "contrctadress_ext",
        description: "missing letters and underscore in contractAddressExt",
    },
    { query: "AS_slice", description: "mixed case with underscore in asSlice" },
    {
        query: "geT_foRwrd_fee",
        description:
            "mixed case, underscore and transposition in getForwardFee",
    },
    { query: "myBlnace", description: "transposition in myBalance" },
    {
        query: "stroeVAr_uint16",
        description:
            "multiple typos in storeVarUint16 (transposition and inconsistent casing)",
    },
    {
        query: "storVar_int32",
        description: "missing letter in storeVarInt32 with inconsistent casing",
    },
    {
        query: "parse_std_adres",
        description: "underscored query with missing letter in parseStdAddress",
    },
    { query: "sEtSeAd", description: "mixed case transposition in setSeed" },
    {
        query: "GAS_conumed",
        description: "underscore and missing letter in gasConsumed",
    },

    {
        query: "st",
        description:
            "Very short query; ambiguous (likely returns nothing or many candidates)",
    },
    {
        query: "get",
        description:
            "Generic query 'get' should ideally return only high-confidence 'get' functions",
    },
    {
        query: "get-",
        description: "Query with punctuation; should ignore the hyphen",
    },
    {
        query: "store-int",
        description: "Hyphenated query; should match storeInt",
    },
    {
        query: "store int",
        description:
            "Query with a space instead of underscore; should match storeInt",
    },
    {
        query: "STOREINT",
        description: "All uppercase query; should match storeInt",
    },
    {
        query: "  storeInt  ",
        description:
            "Query with leading/trailing whitespace; should match storeInt",
    },
    {
        query: "storevar32",
        description: "Query with number appended; should match storeVarUint32",
    },
    {
        query: "storevar16",
        description: "Query with number appended; should match storeVarUint16",
    },
    {
        query: "contrac adress",
        description:
            "Missing letter and space in contractAddress; should match contractAddress",
    },
    {
        query: "parseStd-Address",
        description: "Query with hyphen; should match parseStdAddress",
    },
    {
        query: "cur lt",
        description: "Query with space in curLt; should match curLt",
    },
    {
        query: "get comput fee",
        description: "Query with extra spaces; should match getComputeFee",
    },
    {
        query: "stroe   bool",
        description: "Extra spaces in storeBool; should match storeBool",
    },
    {
        query: "store    var",
        description: "Multiple spaces in storevar; ambiguous but useful",
    },
    {
        query: "get original fwd fee",
        description: "Query with spaces; should match getOriginalFwdFee",
    },
    {
        query: "my  cdoe",
        description:
            "Multiple spaces and a transposition in myCode; should match myCode",
    },
    {
        query: "gas   conumed",
        description:
            "Extra spaces in gasConsumed; should now correctly filter to gasConsumed",
    },
    {
        query: "set  gas  limit",
        description: "Multiple spaces in setGasLimit; should match setGasLimit",
    },
    {
        query: "GAS_conumed",
        description:
            "Mixed case with underscore; should now return only gasConsumed",
    },

    {
        query: "gtsed",
        description: "transposition in getSeed",
    },
    {
        query: "stsed",
        description: "transposition in setSeed",
    },
    {
        query: "mcode",
        description: "transposition in myCode",
    },
    {
        query: "bgncell",
        description: "transposition in beginCell",
    },
    {
        query: "stroeUint",
        description: "transposition in storeUint",
    },
];

describe("suggestFunctions", () => {
    testCases.forEach(({ query, description }) => {
        test(`Snapshot for query "${query}" - ${description}`, () => {
            const suggestions = suggestFunctions(query, functions);
            expect(suggestions).toMatchSnapshot();
        });
    });
});
