const bannerContainer = document.querySelector('.banner-container');
let bannerOffset = 0;

function moveBanner() {
  bannerOffset -= 0.5; 
  bannerContainer.style.transform = `translateX(${bannerOffset}px)`;
  if (Math.abs(bannerOffset) >= bannerContainer.offsetWidth / 2) {
    bannerOffset = 0;
  }
  requestAnimationFrame(moveBanner);
}

moveBanner();
