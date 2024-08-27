import "@stdlib/deploy";
struct InitialData{
    //just random property
    alice: Int as uint32;
    //set default data
    data: String = readFile("./reading-files-text.txt", "base64url");
    //just random property
    bob: Bool;
    //testing decoding cell from file (file ./reading-files-cell.cell contains binary cell with string "Hello world!"
    binaryCell: Cell = cell(readFile("./reading-files-cell.cell", "binary"));
}
trait AbstractConstsHex{
    //read contents as HEX
    const TEXT_HEX: String = readFile("./reading-files-text.txt", "hex");

    get fun isHex(): Bool{
        require(self.TEXT_HEX == "d180d183d181d181d0bad0b8d0b920e697a5e69cace8aa9e20e4b8ade59bbde4baba20d8b9d8b1d8a8d98a20456e676c697368", "Reads with invalid encoding");
        return true;
    }
}
trait AbstractConstUtf8{
    //read contents as UTF-8
    const TEXT_UTF8: String = readFile("./reading-files-text.txt", "utf-8");

    get fun isUtf8(): Bool{
        require(self.TEXT_UTF8 == "русский 日本語 中国人 عربي English", "Invalid file data");
        return true;

    }
}
trait AbstractImageBinary{
    //reads content as binary string
    const IMAGE_DATA: String = (readFile("./reading-files-image.png", "binary"));
    get fun image(): String{
        return self.IMAGE_DATA;
    }
    get fun imageBlob(): Slice{
        return self.IMAGE_DATA.asSlice();
    }
}
trait AbstractStructureWithData{
    get fun initialData(): InitialData{
        return InitialData{alice: 129299912, bob: true};
    }
}
trait FileContentAsComment{
    receive("comment"){
        //should evaluate in compile-time
        let responseImageComment = readFile("./reading-files-image.png", "binary").asComment();
        self.reply(responseImageComment);
    }

}

trait Hashes{
    //should be predicated in compile-time
    const DataRawSha512: Int = sha256(readFile("./reading-files-raw.raw", "binary"));
    get fun validateHash(): Bool{
        //                     echo "0x$(cat ./reading-files-raw.raw | sha256sum)"
        return self.DataRawSha512 == 0x36511e8f1822cee9fe287deb58a03c5fb53907592901deee88eeda2b1a39b56b;
    }

}

contract ReadingFiles with AbstractConstsHex, AbstractConstUtf8, AbstractImageBinary, AbstractStructureWithData, Hashes, Deployable, FileContentAsComment{
    //empty
}

