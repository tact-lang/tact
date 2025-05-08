import { __DANGER__disableVersionNumber } from "@/pipeline/version";
import { allInFolderFunc } from "@/test/utils/all-in-folder.build";

const main = async () => {
    // Disable version number in packages
    __DANGER__disableVersionNumber();

    await allInFolderFunc(__dirname, ["./**/func/**/*.fc"]);
};

void main();
