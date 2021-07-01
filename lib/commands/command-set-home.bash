compute_istio_home(){
 echo "Setting Istio HOME"
 local istioctl_path
 istioctl_path="$(asdf which istioctl)"
  if [[ -n "${istioctl_path}" ]]; then
    export ISTIO_HOME
    ISTIO_HOME="$(dirname "$(dirname "${istioctl_path}")")"
  fi
  echo "Set ISTIO_HOME to $ISTIO_HOME"
}

MY_SHELL="$(basename "$SHELL")"
echo "My Shell is $MY_SHELL"

case "$MY_SHELL" in
'fish')
 echo "Fish"
 ;;
'zsh')
  echo "Default"
  autoload -U add-zsh-hook
  add-zsh-hook precmd compute_istio_home
 ;;
*)
echo "Default"
compute_istio_home
;;
esac 

